SimpleCov.start 'rails' do
  minimum_coverage 90
  coverage_dir('reports/coverage')
  add_group 'Cells',      'app/cells'
  add_group 'Extensions', 'app/extensions'
  add_group 'Forms',      'app/forms'
  add_group 'Policies',   'app/policies'
  add_group 'Services',   'app/services'
end
