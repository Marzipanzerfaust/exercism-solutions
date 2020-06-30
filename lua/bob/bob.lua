local bob = {}

function bob.hey(say)
  local is_blank =    not say:find("[%w%p]")
  local is_question = say:find("?%s*$")
  local is_yell =     say:find("%u") and not say:find("%l")

  if is_blank then
    return "Fine, be that way."
  elseif is_question and is_yell then
    return "Calm down, I know what I'm doing!"
  elseif is_question then
    return "Sure"
  elseif is_yell then
    return "Whoa, chill out!"
  else
    return "Whatever"
  end
end

return bob
