history = empty list (newest at head)

loop:
  line = read line
  if EOF or line == "quit": stop

  (value, rest) = evalExpr(line, history)
  if rest has non-space chars -> error
  id = history length + 1
  print: "<id>: <value as double>"
  history = cons(value, history)

evalExpr(chars, history):
  drop leading spaces
  if empty -> error "unexpected end"

  c = first non-space char

  if c in {+,*,/}:
    (v1, r1) = evalExpr(tail after operator, history)
    (v2, r2) = evalExpr(r1, history)
    return (applyBin(c, v1, v2), r2)

  if c == '-':
    if startsNegativeLiteral(chars):
      return parseInt(chars)
    else:
      (v, r) = evalExpr(tail after '-', history)
      return (applyUn('-', v), r)

  if c == '$':
    (n, r) = parseInt(chars after '$')
    v = historyGetById(history, n)
    return (v, r)

  if c is digit:
    return parseInt(chars)

  else error "invalid token"

applyBin(op, a, b):
  '+' -> a+b
  '*' -> a*b
  '/' -> if b==0 error "divide by zero" else a `div` b

applyUn('-', a) -> -a

parseInt(chars):
  drop spaces
  neg? = head == '-'
  afterMinus = spaces after '-' if neg?
  must see at least one digit
  take digits
  read number, apply sign
  return (number, rest)

historyGetById(hist, n):
  if n<=0 or n>len(hist): error "bad id"
  return reverse(hist)[n-1]