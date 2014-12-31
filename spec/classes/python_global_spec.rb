require 'spec_helper'

describe 'python::global' do
  let(:facts) { default_test_facts }

  context 'system python' do
    let(:params) { {:version => 'system'} }

    it do
      should contain_file('/test/boxen/pyenv/version')
    end
  end

  context 'non-system python' do
    let(:params) { {:version => '3.4.2'} }

    it do
      should contain_file('/test/boxen/pyenv/version').
        that_requires('Python::Version[3.4.2]')
    end
  end
end
