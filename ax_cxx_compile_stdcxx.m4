(e.g. -std=gnu++11)

dnl  This macro is based on the code from the AX_CXX_COMPILE_STDCXX_11 macro
dnl  (serial version number 13).

AC_DEFUN([AX_CXX_COMPILE_STDCXX], [dnl
  m4_if([$1], [11], [ax_cxx_compile_alternatives="11 0x"],
        [$1], [14], [ax_cxx_compile_alternatives="14 1y"],
        [$1], [17], [ax_cxx_compile_alternatives="17 1z"],
        [m4_fatal([invalid first argument `$1' to AX_CXX_COMPILE_STDCXX])])dnl
  m4_if([$2], [], [],
        [$2], [ext], [],
        [$2], [noext], [],
        [m4_fatal([invalid second argument `$2' to AX_CXX_COMPILE_STDCXX])])dnl
  m4_if([$3], [], [ax_cxx_compile_cxx$1_required=true],
        [$3], [mandatory], [ax_cxx_compile_cxx$1_required=true],
        [$3], [optional], [ax_cxx_compile_cxx$1_required=false],
        [m4_fatal([invalid third argument `$3' to AX_CXX_COMPILE_STDCXX])])
  AC_LANG_PUSH([C++])dnl
  ac_success=no
  m4_if([$2], [noext], [], [dnl
  if test x$ac_success = xno; then
    for alternative in ${ax_cxx_compile_alternatives}; do
      switch="-std=gnu++${alternative}"
      cachevar=AS_TR_SH([ax_cv_cxx_compile_cxx$1_$switch])
      AC_CACHE_CHECK(whether $CXX supports C++$1 features with $switch,
                     $cachevar,
        [ac_save_CXX="$CXX"
         CXX="$CXX $switch"
         AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_testbody_$1])],
          [eval $cachevar=yes],
          [eval $cachevar=no])
         CXX="$ac_save_CXX"])
      if eval test x\$$cachevar = xyes; then
        CXX="$CXX $switch"
        if test -n "$CXXCPP" ; then
          CXXCPP="$CXXCPP $switch"
        fi
        ac_success=yes
        break
      fi
    done
  fi])
  m4_if([$2], [ext], [], [dnl
  if test x$ac_success = xno; then
    dnl HP's aCC needs +std=c++11 according to:
    dnl http://h21007.www2.hp.com/portal/download/files/unprot/aCxx/PDF_Release_Notes/769149-001.pdf
    dnl Cray's crayCC needs "-h std=c++11"
    for alternative in ${ax_cxx_compile_alternatives}; do
      for switch in -std=c++${alternative} +std=c++${alternative} "-h std=c++${alternative}"; do
        cachevar=AS_TR_SH([ax_cv_cxx_compile_cxx$1_$switch])
        AC_CACHE_CHECK(whether $CXX supports C++$1 features with $switch,
                       $cachevar,
          [ac_save_CXX="$CXX"
           CXX="$CXX $switch"
           AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_testbody_$1])],
            [eval $cachevar=yes],
            [eval $cachevar=no])
           CXX="$ac_save_CXX"])
        if eval test x\$$cachevar = xyes; then
          CXX="$CXX $switch"
          if test -n "$CXXCPP" ; then
            CXXCPP="$CXXCPP $switch"
          fi
          ac_success=yes
          break
        fi
      done
      if test x$ac_success = xyes; then
        break
      fi
    done
  fi])
  AC_LANG_POP([C++])
  if test x$ax_cxx_compile_cxx$1_required = xtrue; then
    if test x$ac_success = xno; then
      AC_MSG_ERROR([*** A compiler with support for C++$1 language features is required.])
    fi
  fi
  if test x$ac_success = xno; then
    HAVE_CXX$1=0
    AC_MSG_NOTICE([No compiler with C++$1 support was found])
  else
    HAVE_CXX$1=1
    AC_DEFINE(HAVE_CXX$1,1,
              [define if the compiler supports basic C++$1 syntax])
  fi
  AC_SUBST(HAVE_CXX$1)
])


dnl  Test body for checking C++11 support

m4_define([_AX_CXX_COMPILE_STDCXX_testbody_11],
  _AX_CXX_COMPILE_STDCXX_testbody_new_in_11
)


dnl  Test body for checking C++14 support

m4_define([_AX_CXX_COMPILE_STDCXX_testbody_14],
  _AX_CXX_COMPILE_STDCXX_testbody_new_in_11
  _AX_CXX_COMPILE_STDCXX_testbody_new_in_14
)

m4_define([_AX_CXX_COMPILE_STDCXX_testbody_17],
  _AX_CXX_COMPILE_STDCXX_testbody_new_in_11
  _AX_CXX_COMPILE_STDCXX_testbody_new_in_14
  _AX_CXX_COMPILE_STDCXX_testbody_new_in_17
)

dnl  Tests for new features in C++11

m4_define([_AX_CXX_COMPILE_STDCXX_testbody_new_in_11], [[
// If the compiler admits that it is not ready for C++11, why torture it?
// Hopefully, this will speed up the test.
#ifndef __cplusplus
#error "This is not a C++ compiler"
#elif __cplusplus < 201103L
#error "This is not a C++11 compiler"
#else
namespace cxx11
{
  namespace test_static_assert
  {
    template <typename T>
    struct check
    {
      static_assert(sizeof(int) <= sizeof(T), "not big enough");
    };
  }
  namespace test_final_override
  {
    struct Base
    {
      virtual ~Base() {}
      virtual void f() {}
    };
    struct Derived : public Base
    {
      virtual ~Derived() override {}
      virtual void f() override {}
    };
  }
  namespace test_double_right_angle_brackets
  {
    template < typename T >
    struct check {};
    typedef check<void> single_type;
    typedef check<check<void>> double_type;
    typedef check<check<check<void>>> triple_type;
    typedef check<check<check<check<void>>>> quadruple_type;
  }
  namespace test_decltype
  {
    int
    f()
    {
      int a = 1;
      decltype(a) b = 2;
      return a + b;
    }
  }
  namespace test_type_deduction
  {
    template < typename T1, typename T2 >
    struct is_same
    {
      static const bool value = false;
    };
    template < typename T >
    struct is_same<T, T>
    {
      static const bool value = true;
    };
    template < typename T1, typename T2 >
    auto
    add(T1 a1, T2 a2) -> decltype(a1 + a2)
    {
      return a1 + a2;
    }
    int
 test()
    {
      const auto lambda = [](auto&&... args){
        const auto istiny = [](auto x){
          return (sizeof(x) == 1UL) ? 1 : 0;
        };
        const int aretiny[] = { istiny(args)... };
        return aretiny[0];
      };
      return lambda(1, 1L, 1.0f, '1');
    }
  }
  namespace test_binary_literals
  {
    constexpr auto ivii = 0b0000000000101010;
    static_assert(ivii == 42, "wrong value");
  }
  namespace test_generalized_constexpr
  {
    template < typename CharT >
    constexpr unsigned long
    strlen_c(const CharT *const s) noexcept
    {
      auto length = 0UL;
      for (auto p = s; *p; ++p)
        ++length;
      return length;
    }
    static_assert(strlen_c("") == 0UL, "");
    static_assert(strlen_c("x") == 1UL, "");
    static_assert(strlen_c("test") == 4UL, "");
    static_assert(strlen_c("another\0test") == 7UL, "");
  }
  namespace test_lambda_init_capture
  {
    int
    test()
    {
      auto x = 0;
      const auto lambda1 = [a = x](int b){ return a + b; };
      const auto lambda2 = [a = lambda1(x)](){ return a; };
      return lambda2();
    }
  }
  namespace test_digit_separators
  {
    constexpr auto ten_million = 100'000'000;
    static_assert(ten_million == 100000000, "");
  }
  namespace test_return_type_deduction
  {
    auto f(int& x) { return x; }
    decltype(auto) g(int& x) { return x; }
    template < typename T1, typename T2 >
    struct is_same
    {
      static constexpr auto value = false;
    };
    template < typename T >
    struct is_same<T, T>
    {
      static constexpr auto value = true;
    };
    int
    test()
    {
      auto x = 0;
      static_assert(is_same<int, decltype(f(x))>::value, "");
      static_assert(is_same<int&, decltype(g(x))>::value, "");
      return x;
    }
  }
}  // namespace cxx14
#endif  // __cplusplus >= 201402L
]])


dnl  Tests for new features in C++17

m4_define([_AX_CXX_COMPILE_STDCXX_testbody_new_in_17], [[
// If the compiler admits that it is not ready for C++17, why torture it?
// Hopefully, this will speed up the test.
#ifndef __cplusplus
#error "This is not a C++ compiler"
#elif __cplusplus < 201703L
#error "This is not a C++17 compiler"
#else
#include <initializer_list>
#include <utility>
#include <type_traits>
namespace cxx17
{
  namespace test_constexpr_lambdas
  {
    constexpr int foo = [](){return 42;}();
  }
  namespace test::nested_namespace::definitions
  {
  }
  namespace test_fold_expression
  {
    template<typename... Args>
    int multiply(Args... args)
    {
      return (args * ... * 1);
    }
    template<typename... Args>
    bool all(Args... args)
    {
      return (args && ...);
    }
  }
  namespace test_extended_static_assert
  {
    static_assert (true);
  }
  namespace test_auto_brace_init_list
  {
    auto foo = {5};
    auto bar {5};
    static_assert(std::is_same<std::initializer_list<int>, decltype(foo)>::value);
    static_assert(std::is_same<int, decltype(bar)>::value);
  }
  namespace test_typename_in_template_template_parameter
  {
    template<template<typename> typename X> struct D;
  }
  namespace test_fallthrough_nodiscard_maybe_unused_attributes
  {
    int f1()
    {
      return 42;
    }
    [[nodiscard]] int f2()
    {
      [[maybe_unused]] auto unused = f1();
      switch (f1())
      {
      case 17:
        f1();
        [[fallthrough]];
      case 42:
        f1();
      }
      return f1();
    }
  }
  namespace test_extended_aggregate_initialization
  {
    struct base1
    {
      int b1, b2 = 42;
    };
    struct base2
    {
      base2() {
        b3 = 42;
      }
      int b3;
    };
    struct derived : base1, base2
    {
        int d;
    };
    derived d1 {{1, 2}, {}, 4};  // full initialization
    derived d2 {{}, {}, 4};      // value-initialized bases
  }
  namespace test_general_range_based_for_loop
  {
    struct iter
    
      int i;
    };
    bool operator== (const iter& i, const sentinel& s)
    {
      return i.i == s.i;
    }
    bool operator!= (const iter& i, const sentinel& s)
    {
      return !(i == s);
    }
    struct range
    {
      iter begin() const
      {
        return {0};
      }
      sentinel end() const
      {
        return {5};
      }
    };
    void f()
    {
      range r {};
      for (auto i : r)
      {
        [[maybe_unused]] auto v = i;
      }
    }
  }
  namespace test_lambda_capture_asterisk_this_by_value
  {
    struct t
    {
      int i;
      int foo()
      {
        return [*this]()
        {
          return i;
        }();
      }
    };
  }
  namespace test_enum_class_construction
  {
    enum class byte : unsigned char
    {};
    byte foo {42};
  }
  namespace test_constexpr_if
  {
    template <bool cond>
    int f ()
    {
      if constexpr(cond)
      {
        return 13;
      }
      else
      {
        return 42;
      }
    }
  }
  namespace test_selection_statement_with_initializer
  {
    int f()
    {
      return 13;
    }
    int f2()
    {
      if (auto i = f(); i > 0)
      {
        return 3;
      }
      switch (auto i = f(); i + 4)
      {
      case 17:
        return 2;
      default:
        return 1;
      }
    }
  }
  namespace test_template_argument_deduction_for_class_templates
  {
    template <typename T1, typename T2>
    struct pair
    {
      pair (T1 p1, T2 p2)
        : m1 {p1},
          m2 {p2}
      {}
      T1 m1;
      T2 m2;
    };
    void f()
    {
      [[maybe_unused]] auto p = pair{13, 42u};
    }
  }
  namespace test_non_type_auto_template_parameters
  {
    template <auto n>
    struct B
    {};
    B<5> b1;
    B<'a'> b2;
  }
  namespace test_structured_bindings
  {
    int arr[2] = { 1, 2 };
    std::pair<int, int> pr = { 1, 2 };
    auto f1() -> int(&)[2]
    {
      return arr;
    }
    auto f2() -> std::pair<int, int>&
    {
      return pr;
    }
    struct S
    {
      int x1 : 2;
      volatile double y1;
    };
    S f3()
    {
      return {};
    }
    auto [ x1, y1 ] = f1();
    auto& [ xr1, yr1 ] = f1();
    auto [ x2, y2 ] = f2();
    auto& [ xr2, yr2 ] = f2();
    const auto [ x3, y3 ] = f3();
  }
  namespace test_exception_spec_type_system
  {
    struct Good {};
    struct Bad {};
    void g1() noexcept;
    void g2();
    template<typename T>
    Bad
    f(T*, T*);
    template<typename T1, typename T2>
    Good
    f(T1*, T2*);
    static_assert (std::is_same_v<Good, decltype(f(g1, g2))>);
  }
  namespace test_inline_variables
  {
    template<class T> void f(T)
    {}
    template<class T> inline T g(T)
    {
      return T{};
    }
    template<> inline void f<>(int)
    {}
    template<> int g<>(int)
    {
      return 5;
    }
  }
}  // namespace cxx17
#endif  // __cplusplus < 201703L
]])
