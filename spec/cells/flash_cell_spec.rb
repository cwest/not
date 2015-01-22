require 'rails_helper'

describe FlashCell, type: :cell do
  context 'cell rendering' do
    context 'rendering a list' do
      let(:flash) { [%w(notice Notice), %w(alert Alert)] }
      subject { cell(:flash, flash).call(:list) }

      it { is_expected.to have_content('Notice') }
      it { is_expected.to have_content('Alert') }
    end

    context 'rendering show' do
      context 'notice' do
        subject { cell(:flash, name: 'notice', message: 'Notice!').call }

        it { is_expected.to have_selector('.label', text: /success/i) }
        it { is_expected.to have_content('Notice!') }
      end

      context 'alert' do
        subject { cell(:flash, name: 'alert', message: 'Alert!').call }

        it { is_expected.to have_selector('.label', text: /danger/i) }
      end

      context 'bootstrap common' do
        subject { cell(:flash, name: 'info', message: anything).call }

        it { is_expected.to have_selector('.label', text: /info/i) }
      end

      context 'unrecognized' do
        subject { cell(:flash, name: 'unrecognized', message: anything).call }

        it { is_expected.to have_selector('.label', text: /info/i) }
      end
    end
  end
end
