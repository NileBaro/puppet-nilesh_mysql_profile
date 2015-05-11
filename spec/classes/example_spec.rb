require 'spec_helper'

os = ENV['BEAKER_set'] ||= 'centos6'

case os
when /default/
  osversion = '6'
when /centos6/
  osversion = '6'
when /centos7/
  osversion = '7'
else
  raise "Operating system: #{os} is not supported"
end

describe 'nilesh_mysql_profile' do

  include_context "hieradata"
  include_context "facter"

  context 'supported operating systems' do
    describe "mysql class without any parameters on CentOS #{osversion}" do
      let(:params) {{ }}
      let(:facts) do
        default_facts.merge({
        :operatingsystemmajrelease => osversion,
        })
      end

      it { is_expected.to compile.with_all_deps }

      it { is_expected.to contain_class('nilesh_mysql_profile') }
      it { is_expected.to contain_class('nilesh_mysql_profile::params') }

#      it { is_expected.to contain_class('nilesh_mysql_profile::install').that_comes_before('nilesh_mysql_profile::config') }
#      it { is_expected.to contain_class('nilesh_mysql_profile::config') }
#      it { is_expected.to contain_class('nilesh_mysql_profile::service').that_subscribes_to('nilesh_mysql_profile::config') }


      ## Amend as appropriate
      # it { is_expected.to contain_service('mysql') }
      # it { is_expected.to contain_package('mysql').with_ensure('present') }

    end
  end

end
