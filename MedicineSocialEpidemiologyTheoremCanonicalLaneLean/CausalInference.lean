import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyTheoremCanonicalLaneLean

structure CausalInferencePackage where
  counterfactualConsistency : Prop
  exchangeability : Prop
  positivity : Prop
  causalEffectEstimate : Prop
  instrumentalVariable : Prop

structure CausalInferenceEvidence (C : CausalInferencePackage) where
  counterfactualConsistencyClosed : C.counterfactualConsistency
  exchangeabilityClosed : C.exchangeability
  positivityClosed : C.positivity
  causalEffectEstimateClosed : C.causalEffectEstimate
  instrumentalVariableClosed : C.instrumentalVariable

def CausalInferenceClosed (C : CausalInferencePackage) : Prop :=
  C.counterfactualConsistency ∧ C.exchangeability ∧ C.positivity ∧ C.causalEffectEstimate ∧ C.instrumentalVariable

theorem causal_inference_closed_from_evidence (C : CausalInferencePackage)
    (E : CausalInferenceEvidence C) : CausalInferenceClosed C := by
  exact And.intro E.counterfactualConsistencyClosed
    (And.intro E.exchangeabilityClosed
      (And.intro E.positivityClosed
        (And.intro E.causalEffectEstimateClosed E.instrumentalVariableClosed)))

end MedicineSocialEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse