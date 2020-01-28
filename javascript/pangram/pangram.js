export const isPangram = (str) => {
  let sanitized = str.toLowerCase().replace(/[^a-z]/g, "");

  return Array.from(new Set(sanitized)).sort().join("") == "abcdefghijklmnopqrstuvwxyz";
};
