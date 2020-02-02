export const commands = (n) => {
    let comms = [];

    if (n & 1)      comms.push("wink");
    if (n & 1 << 1) comms.push("double blink");
    if (n & 1 << 2) comms.push("close your eyes");
    if (n & 1 << 3) comms.push("jump");
    if (n & 1 << 4) comms.reverse();

    return comms;
};
