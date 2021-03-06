Redmine::Plugin.register :dakoku do
  name 'Dakoku plugin'
  author 'Takaaki Muta'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end


RedmineApp::Application.config.after_initialize do
  MyController.send(:include, MyControllerCalendarExtention)
  User.send(:include, DakokuDatetime::UserExtention)
end
