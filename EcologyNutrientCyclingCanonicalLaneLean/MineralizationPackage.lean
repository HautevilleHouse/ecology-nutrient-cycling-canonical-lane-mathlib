import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure MineralizationPackage where
  netMineralization : ℝ
  immobilization : ℝ
  microbialActivity : ℝ

structure MineralizationEvidence (M : MineralizationPackage) where
  netMineralizationClosed : M.netMineralization > 0
  immobilizationClosed : M.immobilization > 0
  microbialActivityClosed : M.microbialActivity > 0

def MineralizationClosed (M : MineralizationPackage) : Prop :=
  M.netMineralization > 0 ∧ M.immobilization > 0 ∧ M.microbialActivity > 0

theorem mineralization_closed_from_evidence (M : MineralizationPackage) (E : MineralizationEvidence M) :
    MineralizationClosed M := by
  exact And.intro E.netMineralizationClosed (And.intro E.immobilizationClosed E.microbialActivityClosed)

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse