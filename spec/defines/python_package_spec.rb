require "spec_helper"

describe "python::package" do
  let(:facts) { default_test_facts }
  let(:title) { "virtualenv for 3.4.2" }

  let(:params) do
    {
      :package => 'virtualenv',
      :version => '1.11.2',
      :python  => '3.4.2',
    }
  end

  it do
    should include_class("python")

    should contain_pyenv_package("virtualenv for 3.4.2").with({
      :package       => 'virtualenv',
      :version       => '1.11.2',
      :pyenv_root    => '/test/boxen/pyenv',
      :pyenv_version => '3.4.2',
    })
  end
end
