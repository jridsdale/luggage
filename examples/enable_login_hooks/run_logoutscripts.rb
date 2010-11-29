#!/usr/bin/ruby
#
#   Copyright 2009 Joe Block <jpb@ApesSeekingKnowledge.net>
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#

require 'syslog'
require 'hookutils'

def main
  scriptname = $0.split('/')[-1]
  Syslog.open(ident=scriptname)
  runner = HookRunner.new('/etc/hooks', 'LO')
  runner.ihook_setup
  runner.run_all_scripts()
  runner.ihook_teardown
end

main