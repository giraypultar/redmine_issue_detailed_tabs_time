require 'redmine'

class IssueTabsViewListener < Redmine::Hook::ViewListener
  def view_layouts_base_html_head(context)
    javascript_include_tag('issue-history-tabs.js', :plugin => :redmine_issue_detailed_tabs_time)
  end

  render_on :new_issue_view_details, partial: 'issues/details'
end
