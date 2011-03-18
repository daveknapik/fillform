require_relative 'options'

require 'watir'

module TestLeadForm
  class Runner
    def initialize(argv)
      @options = Options.new(argv)
      Watir::Browser.default = 'firefox'
      @b = Watir::Browser.new
    end
    
    def run
      @b.goto @options.url

      @b.text_field(:name, "txtFirstName").set "Dave" if @b.text_field(:name, "txtFirstName").exists?
      @b.text_field(:name, "txtLastName").set "Test" if @b.text_field(:name, "txtLastName").exists?
      @b.text_field(:name, "txtAddress").set "123 Main Street" if @b.text_field(:name, "txtAddress").exists?
      @b.text_field(:name, "txtAptSuite").set "3R" if @b.text_field(:name, "txtAptSuite").exists?
      @b.text_field(:name, "txtCity").set "Chicago" if @b.text_field(:name, "txtCity").exists?
      
      @b.text_field(:name, "txtState").set "IL" if @b.text_field(:name, "txtState").exists?
      @b.select_list(:name, "txtState").set "IL" if @b.select_list(:name, "txtState").exists?
      
      @b.text_field(:name, "txtZip").set "60666" if @b.text_field(:name, "txtZip").exists?
      @b.text_field(:name, "txtEmail").set "David.Knapik@nl.edu" if @b.text_field(:name, "txtEmail").exists?
      @b.text_field(:name, "txtPhone").set "312.261.3108" if @b.text_field(:name, "txtPhone").exists?
      @b.text_field(:name, "txtAltPhone").set "847.453.2900" if @b.text_field(:name, "txtAltPhone").exists?

      if @b.select_list(:name, "ddlEducationLevel").exists?
        ddlEducationLevel_options = @b.select_list(:name, "ddlEducationLevel").getAllContents
        @b.select_list(:name, "ddlEducationLevel").set ddlEducationLevel_options[1]
      end

      if @b.select_list(:name, "ddlAreaInterest").exists?
        ddlAreaInterest_options = @b.select_list(:name, "ddlAreaInterest").getAllContents
        @b.select_list(:name, "ddlAreaInterest").set ddlAreaInterest_options[1]
      end

      if @b.select_list(:name,"ddlProgramInterest").exists?
        ddlProgramInterest_options = @b.select_list(:name, "ddlProgramInterest").getAllContents
        @b.select_list(:name, "ddlProgramInterest").set ddlProgramInterest_options[1]
      end

      if @b.select_list(:name,"howDidYouHearAboutUs").exists?
        howDidYouHearAboutUs_options = @b.select_list(:name, "howDidYouHearAboutUs").getAllContents
        @b.select_list(:name, "howDidYouHearAboutUs").set howDidYouHearAboutUs_options[1]
      end

      if @options.submit
        @b.button(:value, "Submit").click if @b.button(:value, "Submit").exists?
        @b.button(:name, "Submit").click if @b.button(:name, "Submit").exists?
        @b.button(:name, "cmdSubmit").click if @b.button(:name, "cmdSubmit").exists?
      end
    end
  end
end

