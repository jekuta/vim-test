source spec/support/helpers.vim

describe "Webdriver"

  before
    cd spec/fixtures/webdriver
  end

  after
    call Teardown()
    cd -
  end

  it "runs file tests"
    view test/specs/example.js
    TestFile

    Expect g:test#last_command == 'wdio wdio.conf.js ---spec test/specs/example.js'
  end

  it "runs test suites"
    view test/specs/example.js
    TestSuite

    Expect g:test#last_command == 'wdio wdio.conf.js'
  end

end
