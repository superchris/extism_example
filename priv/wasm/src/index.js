
export function foo() {
  const input = JSON.parse(Host.inputString());
  input.foo = input.foo + ' and more';
  Host.outputString(JSON.stringify(input));
}


