import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyTheoremCanonicalLaneLean

structure SocialStratificationData where
  socioeconomicStatusMeasured : Prop
  socialGradientExists : Prop
  healthInequalityDecomposition : Prop
  mediatingPathwaysIdentified : Prop

structure SocialStratificationEvidence (S : SocialStratificationData) where
  socioeconomicStatusMeasuredClosed : S.socioeconomicStatusMeasured
  socialGradientExistsClosed : S.socialGradientExists
  healthInequalityDecompositionClosed : S.healthInequalityDecomposition
  mediatingPathwaysIdentifiedClosed : S.mediatingPathwaysIdentified

def SocialStratificationClosed (S : SocialStratificationData) : Prop :=
  S.socioeconomicStatusMeasured ∧ S.socialGradientExists ∧ S.healthInequalityDecomposition ∧ S.mediatingPathwaysIdentified

theorem social_stratification_closed_from_evidence (S : SocialStratificationData)
    (E : SocialStratificationEvidence S) : SocialStratificationClosed S := by
  exact And.intro E.socioeconomicStatusMeasuredClosed
    (And.intro E.socialGradientExistsClosed
      (And.intro E.healthInequalityDecompositionClosed E.mediatingPathwaysIdentifiedClosed))

end MedicineSocialEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse