require "spec_helper"

describe 'python::plugin' do
  let(:facts) { default_test_facts }

  let(:title) { "pyenv-virtualenv" }

  let(:params) do
    {
      :ensure => "v20141211",
      :source => "yyuu/pyenv-virtualenv",
    }
  end

  it do
    should include_class("python")

    should contain_repository("/test/boxen/pyenv/plugins/pyenv-virtualenv").with({
      :ensure => "v20141211",
      :source => "yyuu/pyenv-virtualenv"
    })
  end
end
