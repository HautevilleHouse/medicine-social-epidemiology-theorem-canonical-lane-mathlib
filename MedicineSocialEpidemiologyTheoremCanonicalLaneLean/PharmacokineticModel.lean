import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyTheoremCanonicalLaneLean

structure PharmacokineticModelPackage where
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationRate : Prop
  clearance : Prop
  halfLife : Prop

structure PharmacokineticModelEvidence (P : PharmacokineticModelPackage) where
  absorptionRateClosed : P.absorptionRate
  distributionVolumeClosed : P.distributionVolume
  eliminationRateClosed : P.eliminationRate
  clearanceClosed : P.clearance
  halfLifeClosed : P.halfLife

def PharmacokineticModelClosed (P : PharmacokineticModelPackage) : Prop :=
  P.absorptionRate ∧ P.distributionVolume ∧ P.eliminationRate ∧ P.clearance ∧ P.halfLife

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModelPackage)
    (E : PharmacokineticModelEvidence P) : PharmacokineticModelClosed P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.distributionVolumeClosed
      (And.intro E.eliminationRateClosed
        (And.intro E.clearanceClosed E.halfLifeClosed)))

end MedicineSocialEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse