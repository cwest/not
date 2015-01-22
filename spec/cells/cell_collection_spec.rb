require 'rails_helper'

RSpec.describe CellCollection do
  class TestCell < Cell::ViewModel
    include CellCollection

    def list
      collection
    end

    def list_filtered
      collection(&:upcase)
    end

    def list_filtered_reverse
      collection :show_reverse do |model|
        model.upcase
      end
    end

    def show
      model
    end

    def show_reverse
      model.reverse
    end
  end

  subject { %w(one two three) }

  it 'renders a collection' do
    rendered = cell(:test, subject).call(:list)
    expect(rendered).to have_content(subject.join)
  end

  it 'renders a filtered collection' do
    rendered = cell(:test, subject).call(:list_filtered)
    expect(rendered).to have_content(subject.join.upcase)
  end

  it 'renders a collection through a specified method' do
    rendered = cell(:test, subject).call(:list_filtered)
    expect(rendered).to have_content(subject.join.upcase)
  end

  it 'renders a filtered collection through a specified method' do
    rendered = cell(:test, subject).call(:list_filtered_reverse)
    expect(rendered).to have_content(subject.map(&:reverse).join.upcase)
  end
end
