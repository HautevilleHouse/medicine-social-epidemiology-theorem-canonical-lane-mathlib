import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyTheoremCanonicalLaneLean

structure SocialDeterminants where
  socioeconomicStatus : Prop
  education : Prop
  neighborhood : Prop
  healthcareAccess : Prop
  socialSupport : Prop

def SocialDeterminantsClosed (S : SocialDeterminants) : Prop :=
  S.socioeconomicStatus ∧ S.education ∧ S.neighborhood ∧ S.healthcareAccess ∧ S.socialSupport

end MedicineSocialEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse