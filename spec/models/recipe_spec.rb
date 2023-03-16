require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:wassim) { User.new(name: 'wassim', email: 'wassimchakib@gmail.com', password: 'a1234cyf') }
  let(:recipe) do
    Recipe.new(name: 'Miso Marinated Short Ribs', preparation_time: '25 min', cooking_time: '20 min',
               description: 'Description of recipe', public: false, user: wassim)
  end
  let(:long_description) do
    'orange quote icon Wash hands with soap and water.  Lightly grease a 3-quart casserole dish and set aside.
    In large skillet over medium-high heat, warm oil. Add shallots and sauté 1 minute. Add chicken strips and
    cook 5 minutes more. orange quote icon Wash hands with soap and water after handling raw chicken.
    Place a layer of bread cubes in the bottom of the dish. In alternating layers, add chicken, spinach,
    sundried tomatoes, cheese and bread, ending with a sprinkling of bread on top.
    In a large bowl, combine eggs, milk, mustard and nutmeg with a whisk.  orange quote icon Wash hands
    after touching raw eggs. Pour mixture over the casserole, cover and refrigerate on lowest shelf 4 hours
    or overnight.  orange quote icon Wash counter after touching eggs. Preheat oven to 350°F. While oven heats,
    remove casserole from refrigerator. Place casserole in oven and bake 35—40 minutes, until golden brown on top.
    orange quote icon Casserole is done with chicken reaches 165 °F as measured with a food thermometer.
    Remove from oven and cool 5 minutes before serving. Serve hot.'
  end
  it 'fails because name should be present' do
    recipe.name = nil
    expect(recipe).to_not be_valid
  end

  it 'fails because user was not provided' do
    recipe.user = nil
    expect(recipe).to_not be_valid
  end

  it 'fails because description is greater than 1000 characters' do
    recipe.description = long_description
    expect(recipe).to_not be_valid
  end
end
