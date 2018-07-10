def ftoc(f_inst)
  (f_inst - 32) * 5 / 9
end

def ctof(c_inst)
  (c_inst.to_f * 9 / 5) + 32
end
