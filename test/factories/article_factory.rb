# == Schema Information
#
# Table name: contents
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  type       :string
#  fields     :jsonb            not null
#  options    :jsonb            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :article do
    name { 'Lorem ipsum' }
    description { 'Lorem ipsum dolor sit amet.' }
    text { <<-TEXT

Lorem ipsum dolor sit amet, consectetur adipiscing elit.Mauris rutrum tellus sed
lectus convallis vestibulum. Vestibulum volutpat lacus id tempus blandit. Nunc
et sapien molestie, varius massa tristique, tempus felis. Pellentesque porttitor
diam sem, a tempus magna varius faucibus. Aliquam placerat interdum nibh sed
suscipit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam quis
consequat eros. Curabitur cursus ex nec lectus rutrum posuere.

Curabitur mi nunc, commodo ut metus vitae, vestibulum congue orci. Suspendisse
et suscipit dui, eget posuere quam. Sed non tortor libero. Phasellus ullamcorper
sem quis nisl vulputate fermentum. Duis quis est blandit, tristique arcu vitae,
mattis mauris. Vestibulum sem erat, posuere sit amet efficitur eget, aliquam nec
nisi. Duis ut rhoncus purus. Proin a egestas nibh, eu luctus leo. Duis purus
libero, mollis ac sodales eu, eleifend dictum urna. Etiam pellentesque nulla in
tellus volutpat placerat. Mauris luctus tincidunt auctor. Cras ac orci finibus,
varius lorem quis, accumsan nulla. Duis tristique nunc sed urna facilisis,
non molestie lorem vehicula. Class aptent taciti sociosqu ad litora torquent per
conubia nostra, per inceptos himenaeos. In consequat mi ex, sed pellentesque
tortor elementum in. Proin at urna maximus, congue quam nec, ullamcorper lectus.

Nunc et turpis eget turpis porttitor varius. Morbi facilisis ligula ac elit
sodales, ac hendrerit est auctor. Praesent ultrices gravida felis, in mattis
arcu. Etiam at neque quam. Nam porta sapien vel viverra suscipit. Mauris ac
augue ac eros semper blandit. Cras id lacinia magna. Aenean tincidunt augue
urna, eu consectetur ante euismod vel. Integer ut tortor eleifend, facilisis
diam ac, aliquet neque. Integer tempor lobortis posuere. Etiam vel fermentum
nisi. Mauris eu tellus massa. Etiam bibendum enim id neque hendrerit, vitae
laoreet nibh mollis. Donec sollicitudin magna et leo tincidunt, eget luctus
massa auctor. Fusce risus augue, ullamcorper quis gravida vitae, interdum et
ante.

Sed non augue sodales, condimentum nisl ut, semper metus. Sed sed dui et nunc
sodales convallis ut vitae nibh. Vestibulum eget imperdiet erat. Duis a nibh
accumsan, sollicitudin odio id, vulputate velit. Aliquam ac mauris rhoncus,
tincidunt lorem ac, blandit lacus. Vestibulum id porttitor leo. Nulla iaculis
varius nulla at egestas. Aliquam erat volutpat. Vivamus lacinia nibh turpis,
id elementum dolor ullamcorper imperdiet. Proin congue congue neque ac finibus.
Curabitur nec orci sed diam hendrerit ullamcorper. Suspendisse condimentum elit
a pulvinar faucibus. Pellentesque at aliquam dolor. Morbi dapibus malesuada
nisl, vehicula tempor tortor vehicula blandit. Maecenas ligula lectus,
aliquet eu purus et, tristique vulputate felis. Donec aliquet, mauris eu
varius tristique, nulla est semper sem, a volutpat massa felis ut libero.

Nulla facilisi. Integer auctor dolor lorem, vehicula vulputate purus tempor at
 Sed urna elit, bibendum ut nisi quis, viverra facilisis purus. Aenean lobortis
imperdiet ullamcorper. Aliquam porttitor tortor ut dolor rutrum tincidunt.
Vestibulum faucibus molestie justo, quis ornare dui ornare id. Vestibulum
ultrices eu orci sed facilisis. Morbi mi est, tempor viverra commodo in,
efficitur ut nunc. Proin luctus ultrices suscipit. Cras pellentesque in urna
eu aliquam.

    TEXT
    }
  end
end
