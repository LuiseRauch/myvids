require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the GenresHelper. For example:
#
# describe GenresHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe GenresHelper, type: :helper do
  describe "genres_to_buttons" do
    it "turns genres into HTML buttons" do
      Comedy = Genre.create!(name: "Comedy")
      Crime = Genre.create!(name: "Crime")
      expected_html = '<a class="btn-xs btn-primary" href="/genres/1">Comedy</a> <a class="btn-xs btn-primary" href="/genres/2">Crime</a>'
      expect(genres_to_buttons([Comedy, Crime])).to eq expected_html
     end
   end
end
