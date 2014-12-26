#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.12
# from Racc grammer file "".
#

require 'racc/parser.rb'
class Coatl < Racc::Parser
##### State transition tables begin ###

racc_action_table = [
     3,     4,     5,    10,     6,     3,     4,     5,    11,     6,
     3,     4,     5,     7,     6,     3,     4,     5,   nil,     6,
     3,     4,     5,   nil,     6 ]

racc_action_check = [
     0,     0,     0,     7,     0,     9,     9,     9,     9,     9,
     2,     2,     2,     1,     2,     8,     8,     8,   nil,     8,
     5,     5,     5,   nil,     5 ]

racc_action_pointer = [
    -2,    13,     8,   nil,   nil,    18,   nil,     3,    13,     3,
   nil,   nil ]

racc_action_default = [
    -1,    -8,    -2,    -3,    -4,    -8,    -6,    -8,    -7,    -8,
    12,    -5 ]

racc_goto_table = [
     2,     1,   nil,   nil,   nil,     9 ]

racc_goto_check = [
     2,     1,   nil,   nil,   nil,     2 ]

racc_goto_pointer = [
   nil,     1,     0 ]

racc_goto_default = [
   nil,   nil,     8 ]

racc_reduce_table = [
  0, 0, :racc_error,
  0, 8, :_reduce_1,
  1, 8, :_reduce_none,
  1, 9, :_reduce_3,
  1, 9, :_reduce_4,
  3, 9, :_reduce_5,
  1, 9, :_reduce_none,
  2, 9, :_reduce_7 ]

racc_reduce_n = 8

racc_shift_n = 12

racc_token_table = {
  false => 0,
  :error => 1,
  :DATA => 2,
  :COMPONENTS => 3,
  :FOR => 4,
  :ENDFOR => 5,
  :STRING => 6 }

racc_nt_base = 7

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "DATA",
  "COMPONENTS",
  "FOR",
  "ENDFOR",
  "STRING",
  "$start",
  "target",
  "string" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'parser.y', 2)
  def _reduce_1(val, _values, result)
    result = 0
    result
  end
.,.,

# reduce 2 omitted

module_eval(<<'.,.,', 'parser.y', 5)
  def _reduce_3(val, _values, result)
    result = data(val[0])
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 6)
  def _reduce_4(val, _values, result)
    result = component(val[0])
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 7)
  def _reduce_5(val, _values, result)
    result = for_coatl(val[0][0],val[0][1],val[1])
    result
  end
.,.,

# reduce 6 omitted

module_eval(<<'.,.,', 'parser.y', 9)
  def _reduce_7(val, _values, result)
    result << val[1]
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Coatl