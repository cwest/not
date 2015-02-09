require 'rails_helper'

describe BrandCell, type: :cell do
  context 'cell rendering' do
    context 'rendering default show' do
      subject { cell(:brand).call }

      it { is_expected.to have_selector('.brand-default') }
      it { is_expected.to have_selector('.brand-logo-default') }
      it { is_expected.to have_selector('.brand-name-default') }
    end

    context 'rendering stylized show' do
      subject { cell(:brand, :style).call }

      it { is_expected.to have_selector('.brand-style') }
      it { is_expected.to have_selector('.brand-logo-style') }
      it { is_expected.to have_selector('.brand-name-style') }
    end

    context 'rendering logo' do
      subject { cell(:brand, :style).call(:logo) }

      it { is_expected.to have_selector('.brand-logo-style') }
    end

    context 'rendering name' do
      subject { cell(:brand, :style).call(:name) }

      it { is_expected.to have_selector('.brand-name-style') }
    end
  end
end
