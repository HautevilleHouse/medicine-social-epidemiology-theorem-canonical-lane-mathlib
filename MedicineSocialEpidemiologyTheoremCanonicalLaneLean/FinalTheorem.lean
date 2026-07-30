import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyTheoremCanonicalLaneLean

def ConstrainedMedicineSocialEpidemiologyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_medicine_social_epidemiology_endgame (A : AdmissibleClass) :
    ConstrainedMedicineSocialEpidemiologyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MedicineSocialEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
