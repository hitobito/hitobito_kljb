# frozen_string_literal: true

#  Copyright (c) 2012-2021, Katholische Landjugendbewegung Paderborn. This file is part of
#  hitobito_kljb and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_kljb.

desc "Crawl app with tarantula"
task :tarantula do # rubocop:disable Rails/RakeEnvironment
  sh "rm -rf ../../../tmp/tarantula"
  sh "rm -rf ../hitobito/tmp/tarantula"
  sh "bash -c \"RAILS_ENV=test #{ENV["APP_ROOT"]}/bin/with_mysql " \
     'rake app:tarantula:test"'
end
