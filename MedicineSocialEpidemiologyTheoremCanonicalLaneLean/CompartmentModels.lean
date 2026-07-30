import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyTheoremCanonicalLaneLean

structure CompartmentModel where
  compartments : Type
  populations : compartments → ℝ
  transitionRates : (c1 c2 : compartments) → ℝ
  conservationLaw : (∑ c in compartments, populations c) = 1

structure CompartmentModelEvidence (M : CompartmentModel) where
  populationsPositive : ∀ c, M.populations c ≥ 0
  transitionNonnegative : ∀ c1 c2, M.transitionRates c1 c2 ≥ 0
  conservationLawClosed : M.conservationLaw

def CompartmentModelClosed (M : CompartmentModel) : Prop :=
  (∀ c, M.populations c ≥ 0) ∧ (∀ c1 c2, M.transitionRates c1 c2 ≥ 0) ∧ M.conservationLaw

theorem compartment_model_closed_from_evidence (M : CompartmentModel) (E : CompartmentModelEvidence M) :
    CompartmentModelClosed M := by
  exact And.intro E.populationsPositive (And.intro E.transitionNonnegative E.conservationLawClosed)

end MedicineSocialEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse