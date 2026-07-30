import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyTheoremCanonicalLaneLean

structure DiagnosticTest where
  sensitivity : ℝ
  specificity : ℝ
  prevalence : ℝ
  positivePredictiveValue : ℝ
  negativePredictiveValue : ℝ

structure DiagnosticTestEvidence (T : DiagnosticTest) where
  sensitivityInUnit : T.sensitivity ∈ Set.Icc (0 : ℝ) 1
  specificityInUnit : T.specificity ∈ Set.Icc (0 : ℝ) 1
  prevalenceInUnit : T.prevalence ∈ Set.Icc (0 : ℝ) 1
  ppvDerived : T.positivePredictiveValue = (T.sensitivity * T.prevalence) / (T.sensitivity * T.prevalence + (1 - T.specificity) * (1 - T.prevalence))
  npvDerived : T.negativePredictiveValue = (T.specificity * (1 - T.prevalence)) / ((1 - T.sensitivity) * T.prevalence + T.specificity * (1 - T.prevalence))

def DiagnosticTestClosed (T : DiagnosticTest) : Prop :=
  T.sensitivity ∈ Set.Icc (0 : ℝ) 1 ∧ T.specificity ∈ Set.Icc (0 : ℝ) 1 ∧
  T.prevalence ∈ Set.Icc (0 : ℝ) 1 ∧
  T.positivePredictiveValue = (T.sensitivity * T.prevalence) / (T.sensitivity * T.prevalence + (1 - T.specificity) * (1 - T.prevalence)) ∧
  T.negativePredictiveValue = (T.specificity * (1 - T.prevalence)) / ((1 - T.sensitivity) * T.prevalence + T.specificity * (1 - T.prevalence))

theorem diagnostic_test_closed_from_evidence (T : DiagnosticTest) (E : DiagnosticTestEvidence T) :
    DiagnosticTestClosed T := by
  exact And.intro E.sensitivityInUnit (And.intro E.specificityInUnit (And.intro E.prevalenceInUnit (And.intro E.ppvDerived E.npvDerived)))

end MedicineSocialEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse