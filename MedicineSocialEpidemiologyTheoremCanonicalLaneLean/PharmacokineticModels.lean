import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyTheoremCanonicalLaneLean

structure OneCompartmentPKModel where
  dose : ℝ
  volume : ℝ
  eliminationRate : ℝ
  time : ℝ → ℝ
  concentration : ℝ → ℝ

structure OneCompartmentPKModelEvidence (M : OneCompartmentPKModel) where
  dosePositive : M.dose > 0
  volumePositive : M.volume > 0
  eliminationRatePositive : M.eliminationRate > 0
  concentrationFormula : ∀ t, M.concentration t = (M.dose / M.volume) * Real.exp (-M.eliminationRate * t)

def OneCompartmentPKModelClosed (M : OneCompartmentPKModel) : Prop :=
  M.dose > 0 ∧ M.volume > 0 ∧ M.eliminationRate > 0 ∧
  (∀ t, M.concentration t = (M.dose / M.volume) * Real.exp (-M.eliminationRate * t))

theorem one_compartment_pk_model_closed_from_evidence (M : OneCompartmentPKModel) (E : OneCompartmentPKModelEvidence M) :
    OneCompartmentPKModelClosed M := by
  exact And.intro E.dosePositive (And.intro E.volumePositive (And.intro E.eliminationRatePositive E.concentrationFormula))

end MedicineSocialEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse