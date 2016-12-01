require 'spec_helper'

feature "filter by tags" do
  scenario "When user vists /tags/:tags" do
     link = Link.new(url: 'www.Busty.com', title: 'BB')
     tag = Tag.first_or_create(tags: 'bubbles')
     link.tags << tag
     link.save

    #  link = Link.new(url: 'www.yomom.com', title: 'DD')
    #  tag = Tag.first_or_create(name: 'Yekkwlvfhkgwfehjvbhsdfvwjfydvgdfjgerjkgbrjwbrwejkrvgj')
    #  link.tags << tag
    #  link.save

     visit '/tags/bubbles'

    expect(page).not_to have_content('www.yomom.com')
    expect(page).to have_content('www.Busty.com')
  end
end
