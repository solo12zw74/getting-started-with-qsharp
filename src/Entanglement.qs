open Microsoft.Quantum.Intrinsic;
open Microsoft.Quantum.Canon;

// This operation prepares a qubit in a superposition of |0⟩ and |1⟩ states, then create one entangled qubit and another one unentangled.
// Finally it measures all three and it shows how entangled and unentangled qubits are behavior.
operation Entanglement() : (Result, Result, Result) {
    use q1 = Qubit();
    use q2 = Qubit();
    use q3 = Qubit();
    H(q1);
    CNOT(q1, q2);
    H(q3);

    let result1 = M(q1);
    let result2 = M(q2);
    let result3 = M(q3);
    Reset(q1);
    Reset(q2);
    Reset(q3);
    return (result1, result2, result3);
}
