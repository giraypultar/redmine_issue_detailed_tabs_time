require 'redmine'
require_dependency 'issues_helper'

ActionDispatch::Callbacks.to_prepare do
  Dir[File.dirname(__FILE__) + '/lib/redmine_issue_detailed_tabs_time/patches/*_patch.rb'].each {|file|
    require_dependency file
  }

  Dir[File.dirname(__FILE__) + '/lib/redmine_issue_detailed_tabs_time/hooks/*_hook.rb'].each {|file|
    require_dependency file
  }
end

Redmine::Plugin.register :redmine_issue_detailed_tabs_time do
  project_module :issue_tracking do
	  permission :view_all, { :all => :index }
	  permission :view_comments, { :all => :index }
	  permission :view_activity, { :all => :index }
  end
  name 'Redmine Issue Detailed Tabs & Time'
  author 'Mark Kalender'
  description 'This plugin provide breaks down issues comments into tabs, also adds a time log'
  version '1.0.0'
  url 'https://github.com/GabrielCC/redmine_issue_detailed_tabs_time'
end
