import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyTheoremCanonicalLaneLean

structure CausalContrastData where
  exposureDefined : Prop
  potentialOutcomesConsistency : Prop
  noUnmeasuredConfounding : Prop
  positivity : Prop

structure CausalContrastEvidence (C : CausalContrastData) where
  exposureDefinedClosed : C.exposureDefined
  potentialOutcomesConsistencyClosed : C.potentialOutcomesConsistency
  noUnmeasuredConfoundingClosed : C.noUnmeasuredConfounding
  positivityClosed : C.positivity

def CausalContrastClosed (C : CausalContrastData) : Prop :=
  C.exposureDefined ∧ C.potentialOutcomesConsistency ∧ C.noUnmeasuredConfounding ∧ C.positivity

theorem causal_contrast_closed_from_evidence (C : CausalContrastData)
    (E : CausalContrastEvidence C) : CausalContrastClosed C := by
  exact And.intro E.exposureDefinedClosed
    (And.intro E.potentialOutcomesConsistencyClosed
      (And.intro E.noUnmeasuredConfoundingClosed E.positivityClosed))

end MedicineSocialEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse