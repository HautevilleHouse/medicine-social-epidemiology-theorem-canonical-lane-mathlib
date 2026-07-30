import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyTheoremCanonicalLaneLean

structure StudyDesign where
  populationSize : ℕ
  exposedGroup : ℕ
  controlGroup : ℕ
  outcomeRateExposed : ℝ
  outcomeRateControl : ℝ
  relativeRisk : ℝ
  attributableRisk : ℝ

structure StudyDesignEvidence (D : StudyDesign) where
  groupsNonnegative : D.exposedGroup ≥ 0 ∧ D.controlGroup ≥ 0
  ratesInUnit : D.outcomeRateExposed ∈ Set.Icc (0 : ℝ) 1 ∧ D.outcomeRateControl ∈ Set.Icc (0 : ℝ) 1
  relativeRiskFormula : D.relativeRisk = D.outcomeRateExposed / D.outcomeRateControl
  attributableRiskFormula : D.attributableRisk = D.outcomeRateExposed - D.outcomeRateControl

def StudyDesignClosed (D : StudyDesign) : Prop :=
  (D.exposedGroup ≥ 0 ∧ D.controlGroup ≥ 0) ∧
  (D.outcomeRateExposed ∈ Set.Icc (0 : ℝ) 1 ∧ D.outcomeRateControl ∈ Set.Icc (0 : ℝ) 1) ∧
  D.relativeRisk = D.outcomeRateExposed / D.outcomeRateControl ∧
  D.attributableRisk = D.outcomeRateExposed - D.outcomeRateControl

theorem study_design_closed_from_evidence (D : StudyDesign) (E : StudyDesignEvidence D) :
    StudyDesignClosed D := by
  exact And.intro E.groupsNonnegative (And.intro E.ratesInUnit (And.intro E.relativeRiskFormula E.attributableRiskFormula))

end MedicineSocialEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse