import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyTheoremCanonicalLaneLean

structure ConfoundingControlData where
  measuredConfounders : Prop
  unmeasuredConfoundersSensitivity : Prop
  adjustmentMethodValid : Prop
  causalEffectIdentified : Prop

structure ConfoundingControlEvidence (C : ConfoundingControlData) where
  measuredConfoundersClosed : C.measuredConfounders
  unmeasuredConfoundersSensitivityClosed : C.unmeasuredConfoundersSensitivity
  adjustmentMethodValidClosed : C.adjustmentMethodValid
  causalEffectIdentifiedClosed : C.causalEffectIdentified

def ConfoundingControlClosed (C : ConfoundingControlData) : Prop :=
  C.measuredConfounders ∧ C.unmeasuredConfoundersSensitivity ∧ C.adjustmentMethodValid ∧ C.causalEffectIdentified

theorem confounding_control_closed_from_evidence (C : ConfoundingControlData)
    (E : ConfoundingControlEvidence C) : ConfoundingControlClosed C := by
  exact And.intro E.measuredConfoundersClosed
    (And.intro E.unmeasuredConfoundersSensitivityClosed
      (And.intro E.adjustmentMethodValidClosed E.causalEffectIdentifiedClosed))

end MedicineSocialEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse