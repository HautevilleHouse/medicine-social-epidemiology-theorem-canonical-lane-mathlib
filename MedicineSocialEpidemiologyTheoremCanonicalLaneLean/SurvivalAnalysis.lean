import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyTheoremCanonicalLaneLean

structure SurvivalAnalysisPackage where
  hazardFunction : Type u
  survivalFunction : Type v
  coxProportionalHazards : Prop
  logRankTest : Prop
  kaplanMeierEstimator : Prop
  censoringHandling : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  coxProportionalHazardsClosed : S.coxProportionalHazards
  logRankTestClosed : S.logRankTest
  kaplanMeierEstimatorClosed : S.kaplanMeierEstimator
  censoringHandlingClosed : S.censoringHandling

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.coxProportionalHazards ∧ S.logRankTest ∧
  S.kaplanMeierEstimator ∧ S.censoringHandling

theorem survival_analysis_closed_from_evidence
    (S : SurvivalAnalysisPackage) (E : SurvivalAnalysisEvidence S) :
    SurvivalAnalysisClosed S := by
  exact And.intro E.coxProportionalHazardsClosed
    (And.intro E.logRankTestClosed
      (And.intro E.kaplanMeierEstimatorClosed E.censoringHandlingClosed))

end MedicineSocialEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
