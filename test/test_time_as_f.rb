require "minitest/autorun"
require "minitest/benchmark" if ENV["BENCH"]
require "time_as_f"

class TestTimeToF < Minitest::Test
  def test_cls_as_i
    assert_in_delta Time.now.to_i, Time.as_i, 1
  end

  def test_cls_as_f
    assert_in_delta Time.now.to_f, Time.as_f, 1
  end

  def self.bench_range
    bench_exp 1000, 1_000_000, 10
  end

  def bench_to_i
    assert_performance_linear do |n|
      n.times do
        Time.now.to_i
      end
    end
    # p [a, b, rr]
  end

  def bench_to_f
    assert_performance_linear do |n|
      n.times do
        Time.now.to_f
      end
    end
    # p [a, b, rr]
  end

  def bench_cls_as_i
    assert_performance_linear do |n|
      n.times do
        Time.as_i
      end
    end
    # p [a, b, rr]
  end

  def bench_cls_as_f
    assert_performance_linear do |n|
      n.times do
        Time.as_f
      end
    end
    # p [a, b, rr]
  end
end
