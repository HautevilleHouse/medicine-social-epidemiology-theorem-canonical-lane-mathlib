import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyTheoremCanonicalLaneLean

structure MetaAnalysisPackage where
  effectSize : Prop
  heterogeneity : Prop
  publicationBias : Prop
  randomEffectsModel : Prop
  subgroupAnalysis : Prop
  forestPlot : Prop

structure MetaAnalysisEvidence (M : MetaAnalysisPackage) where
  effectSizeClosed : M.effectSize
  heterogeneityClosed : M.heterogeneity
  publicationBiasClosed : M.publicationBias
  randomEffectsModelClosed : M.randomEffectsModel
  subgroupAnalysisClosed : M.subgroupAnalysis
  forestPlotClosed : M.forestPlot

def MetaAnalysisClosed (M : MetaAnalysisPackage) : Prop :=
  M.effectSize ∧ M.heterogeneity ∧ M.publicationBias ∧
  M.randomEffectsModel ∧ M.subgroupAnalysis ∧ M.forestPlot

theorem meta_analysis_closed_from_evidence (M : MetaAnalysisPackage)
    (E : MetaAnalysisEvidence M) : MetaAnalysisClosed M := by
  exact And.intro E.effectSizeClosed
    (And.intro E.heterogeneityClosed
      (And.intro E.publicationBiasClosed
        (And.intro E.randomEffectsModelClosed
          (And.intro E.subgroupAnalysisClosed E.forestPlotClosed))))

end MedicineSocialEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
