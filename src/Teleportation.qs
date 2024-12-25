open Microsoft.Quantum.Intrinsic;
open Microsoft.Quantum.Canon;

// This operation prepares 3 qubits. The first one presents the message to send, and the other two are the entangled qubits.
// Finally it measures all three and it shows how entangled and unentangled qubits are behavior.
operation Teleportation(sentMessage: Bool) : Bool {
    mutable receivedMessage = false;
    use register = Qubit[3];
    let message = register[0];

    if (sentMessage) {
        X(message);
    }

    let alice = register[1];
    let bob = register[2];

    // Entangle the Alice's qubit with the Bob's qubit
    H(alice);
    CNOT(alice, bob);
    
    // Change the Alice's qubit to be teleported
    CNOT(message, alice);
    H(message);

    // Measure the qubits
    let messageState = M(message);
    let aliceState = M(alice);

    // Define Bell's state for the teleportation
    if (messageState == One) {
        Z(bob);
    }

    if (aliceState == One) {
        X(bob);
    }

    // Measure the Bob's qubit
    if (M(bob) == One) {
        set receivedMessage = true;
    }

    ResetAll(register);

    return receivedMessage;
}
