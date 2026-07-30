import canonicalLaneMathlib.AdmissibleClass
import ZetaFunctionsLFunctionsNumberCanonicalLaneLean.DirichletLFunctionLayer
import ZetaFunctionsLFunctionsNumberCanonicalLaneLean.ModularFormLFunctionLayer

namespace HautevilleHouse
namespace ZetaFunctionsLFunctionsNumberCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedTheoremClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_theorem_closure (A : AdmissibleClass) : ConstrainedTheoremClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

def ZetaLFunctionClosure (A : AdmissibleClass) : Prop :=
  ConstrainedTheoremClosure A ∧
  DirichletLFunctionLayerClosed dirichletLFunctionLayerCertificate ∧
  ModularFormLFunctionLayerClosed modularFormLFunctionLayerCertificate

theorem zeta_lfunction_endgame (A : AdmissibleClass) : ZetaLFunctionClosure A :=
  And.intro (constrained_theorem_closure A)
    (And.intro dirichlet_lfunction_layer_closed_checked modular_form_lfunction_layer_closed_checked)

end ZetaFunctionsLFunctionsNumberCanonicalLaneLean
end HautevilleHouse