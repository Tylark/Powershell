# HelpDeskTicketDemo.ps1

class HelpDeskTicket {
    [int]$TicketId
    [string]$User
    [string]$Issue
    [string]$Status

    HelpDeskTicket([int]$ticketId, [string]$user, [string]$issue) {
        $this.TicketId = $ticketId
        $this.User = $user
        $this.Issue = $issue
        $this.Status = "Open"
    }

    [void] CloseTicket() {
        $this.Status = "Closed"
    }

    [string] GetSummary() {
        return "Ticket $($this.TicketId): $($this.User) - $($this.Issue) [$($this.Status)]"
    }
}

$ticket1 = [HelpDeskTicket]::new(101, "jsmith", "Cannot access shared folder")
$ticket2 = [HelpDeskTicket]::new(102, "agarcia", "Password reset needed")
$ticket3 = [HelpDeskTicket]::new(103, "mlee", "Printer not responding")

Write-Output "Before closing ticket:"
Write-Output $ticket1.GetSummary()
Write-Output $ticket2.GetSummary()
Write-Output $ticket3.GetSummary()

$ticket2.CloseTicket()

Write-Output ""
Write-Output "After closing ticket 102:"
Write-Output $ticket1.GetSummary()
Write-Output $ticket2.GetSummary()
Write-Output $ticket3.GetSummary()