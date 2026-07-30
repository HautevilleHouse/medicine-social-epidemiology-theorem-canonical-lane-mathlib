import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyTheoremCanonicalLaneLean

structure CompartmentModelPackage where
  compartments : Type u
  transitionRates : Type v
  systemSolver : Type w
  basicReproductionNumber : Prop
  endemicEquilibrium : Prop
  stabilityCondition : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  basicReproductionNumberClosed : C.basicReproductionNumber
  endemicEquilibriumClosed : C.endemicEquilibrium
  stabilityConditionClosed : C.stabilityCondition

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.basicReproductionNumber ∧ C.endemicEquilibrium ∧ C.stabilityCondition

theorem compartment_model_closed_from_evidence
    (C : CompartmentModelPackage) (E : CompartmentModelEvidence C) :
    CompartmentModelClosed C := by
  exact And.intro E.basicReproductionNumberClosed
    (And.intro E.endemicEquilibriumClosed E.stabilityConditionClosed)

end MedicineSocialEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
