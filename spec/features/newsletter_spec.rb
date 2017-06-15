require 'spec_helper'

feature "Newsletters" do
  scenario "POST /admin/newsletters" do

    # check that the pdf is successfully uploaded to s3
    # check if the naming convention is satisfied
    # create cover image for the news item from pdf

    lambda {
      visit new_admin_newsletter_path
      fill_in "Title", :with => "Dribbling Balls 2017 - Volume 30 edition 2"
      fill_in "Author", :with => "adriansarstedt"
      fill_in "Content", :with => "Adrian updates the website!"
      attach_file "Newsletter PDF", "#{Rails.root.to_s}/spec/fixtures/2013_12_29_volume_029_issue_010.pdf/"
      click_button "Create Newsletter"
      page.should have_content("Newsletter was successfully created.")
      page.should have_content("Dribbling Balls 2017 - Volume 30 edition 2")
    }.should change(NewsItem.dribbling_balls, :count).by(1)
  end

  scenario "POST /admin/newsletters/:id/send" do
    # emails should only go to current members
    # emailing a newsletter should only be available on a newsletter edit screen if it hasn't been sent before
    # we should be able to modify the body of the email that is sent
    # the newsletters admin list should show the sent date if a newsletter has been emailed to memebers
    # field to add extra bcc recipients
    # should always bcc the committee@melbourneunibasketball.org.au
    # email should be sent from social@melbourneunibasketball.org.au
    # email body should contain an inline image of the cover of the newsletter and that should link to the amazon s3 url
    # email should also have an attachment of the pdf document itself
    # email title should contain MUBC Newsletter - "field that they can enter"
    # only a super-admin can share newsletter through email
  end
end
