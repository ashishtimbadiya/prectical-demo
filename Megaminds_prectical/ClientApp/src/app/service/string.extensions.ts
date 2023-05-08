export { };

declare global {
  interface String {
    isUsernameValid(): boolean;
  }
}
String.prototype.isUsernameValid = function (this: string) {
  const s = this;
  if (!s || String(s).trim() === '') {
    return false;
  }
  const pattern = /^(?!.*\.\.)(?!.*\.$)[^\W][\w.]{0,29}$/igm;
  return pattern.test(s);
};
