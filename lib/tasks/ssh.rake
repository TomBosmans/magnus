namespace :ssh do
  desc "Copy the local environment_variables.rb to remote destination."
  task copy_environment_variables: :environment do
    args = args_with_defaults(
      source: ENV['ENV_VAR_SOURCE_PATH'],
      destination: ENV['ENV_VAR_DESTINATION_PATH'],
      file_name: ENV.fetch('ENV_VAR_FILE_NAME', 'environment_variables.rb')
    )

    system copy_executable(args)
  end

  desc "Copy the local master.key to remote destination."
  task copy_master_key: :environment do
    args = args_with_defaults(
      source: ENV['MASTER_KEY_SOURCE_PATH'],
      destination: ENV['MASTER_KEY_DESTINATION_PATH'],
      file_name: ENV.fetch('MASTER_KEY_FILE_NAME', 'master.key')
    )

    system copy_executable(args)
  end

  def copy_executable(args)
    [create_destination_command(args), copy_command(args)].join(' && ')
  end

  def create_destination_command(args)
    user = args[:user]
    domain = args[:domain]
    directory = "#{args[:destination]}"
    "ssh #{user}@#{domain} 'mkdir -p #{directory}'"
  end

  def copy_command(args)
    user = args[:user]
    domain = args[:domain]
    from = "#{args[:source]}#{args[:file_name]}"
    to = "#{args[:destination]}#{args[:file_name]}"
    "scp #{from} #{user}@#{domain}:/#{to}"
  end

  # override args by setting the lower case env variables.
  # example:
  #     $ bundle exec rake ssh:copy_environment_variables user=waldo
  # If these are not set then it will fallback to the environment variables
  def args_with_defaults(source:, destination:, file_name:)
    {
      user: ENV.fetch('user', ENV['SERVER_USER']),
      source: ENV.fetch('source', source),
      destination: ENV.fetch('destination', destination),
      domain: ENV.fetch('domain', ENV['SERVER_DOMAIN']),
      file_name: ENV.fetch('file_name', file_name)
    }
  end
end
