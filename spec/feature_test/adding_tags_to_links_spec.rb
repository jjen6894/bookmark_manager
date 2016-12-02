require 'spec_helper'
feature 'Adding tags' do

  scenario 'I can add a single tag to a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags',  with: 'education'

    click_button 'Bookmark link'
    link = Link.first
    expect(link.tags.map(&:tags)).to include('education')
  end

  scenario "I can add multiple tags to a new link" do
    visit '/links/new'
    fill_in 'url',   with: 'www.abc.com'
    fill_in 'title', with: 'ABC'
    fill_in 'tags',  with: 'education alphabet'

    click_button 'Bookmark link'
    link = Link.first
    expect(link.tags.map(&:tags)).to include('education', 'alphabet')
  end


end
