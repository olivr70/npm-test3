import { add } from "../math"
describe("math", () => {
  test("add", () => {
    expect(add(2,3)).toBe(5);
    expect(add(undefined,3)).toBe(undefined)
    expect(add(2, undefined)).toBe(undefined)
  })
})
