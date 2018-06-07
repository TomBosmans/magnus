module IconHelper
  ICONS_FOR_CLASS = {
    Group => 'folder'
  }.freeze

  def icon_for(klass)
    ICONS_FOR_CLASS.fetch(klass, 'insert_drive_file')
  end
end
