require 'rubygems'
require 'inline'

class Time
  VERSION = '1.0.0'

  inline :C do |b|
    b.include "<time.h>"
    b.include "<sys/time.h>"

    b.c_singleton "long as_i() { return time(0); }"

    b.c_singleton "double as_f() {
      static struct timeval tv;

      if (gettimeofday(&tv, 0) < 0)
        return -1;

      return tv.tv_sec + (tv.tv_usec / 1000000.0);
    }"
  end
end

# static VALUE
# time_init_0(VALUE time)
# {
#     struct time_object *tobj;
#     struct timespec ts;
#
#     time_modify(time);
#     GetNewTimeval(time, tobj);
#     tobj->gmt = 0;
#     tobj->tm_got=0;
#     tobj->timew = WINT2FIXWV(0);
# #ifdef HAVE_CLOCK_GETTIME
#     if (clock_gettime(CLOCK_REALTIME, &ts) == -1) {
#         rb_sys_fail("clock_gettime");
#     }
# #else
#     {
#         struct timeval tv;
#         if (gettimeofday(&tv, 0) < 0) {
#             rb_sys_fail("gettimeofday");
#         }
#         ts.tv_sec = tv.tv_sec;
#         ts.tv_nsec = tv.tv_usec * 1000;
#     }
# #endif
#     tobj->timew = timespec2timew(&ts);
#
#     return time;
# }
