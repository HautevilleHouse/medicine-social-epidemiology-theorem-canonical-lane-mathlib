import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyTheoremCanonicalLaneLean

structure DiagnosticInferencePackage where
  prevalence : Prop
  sensitivity : Prop
  specificity : Prop
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  rocCurve : Prop

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  prevalenceClosed : D.prevalence
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  positivePredictiveValueClosed : D.positivePredictiveValue
  negativePredictiveValueClosed : D.negativePredictiveValue
  rocCurveClosed : D.rocCurve

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  D.prevalence ∧ D.sensitivity ∧ D.specificity ∧
  D.positivePredictiveValue ∧ D.negativePredictiveValue ∧ D.rocCurve

theorem diagnostic_inference_closed_from_evidence
    (D : DiagnosticInferencePackage) (E : DiagnosticInferenceEvidence D) :
    DiagnosticInferenceClosed D := by
  exact And.intro E.prevalenceClosed
    (And.intro E.sensitivityClosed
      (And.intro E.specificityClosed
        (And.intro E.positivePredictiveValueClosed
          (And.intro E.negativePredictiveValueClosed E.rocCurveClosed))))

end MedicineSocialEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
