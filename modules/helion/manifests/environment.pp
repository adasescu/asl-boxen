class helion::environment {

include go
  go::version { '1.3.1': }

  include virtualbox
  include vagrant
  include chrome

}
